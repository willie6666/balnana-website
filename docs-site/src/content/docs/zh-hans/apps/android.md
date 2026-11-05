---
title: Android 正式版构建
description: 按 App 要上架的地方选择构建，用自己的密钥签名，并为 Google Play 或 F-Droid 做好准备。
---

## 两种构建

App 有两个 flavor，使用相同的应用 ID。区别在于[方案](/docs/zh-hans/self-hosting/plans-and-payments/)的付款方式，以及 APK 里是否包含 Google 的闭源付款库：

- `foss`，默认：不含 Google Play 付款。用于 F-Droid 与直接下载；加上 `--dart-define=BALNANA_EXTERNAL_PAYMENTS=true` 即可提供 Ko-fi 与 PayPal 付款。
- `play`：销售 Google Play 订阅。设置 `BALNANA_EXTERNAL_PAYMENTS` 时会拒绝构建，因为 Google Play 不允许 App 引导用户到其他地方付款。

```bash
flutter build appbundle --flavor play
flutter build apk --release --flavor foss --dart-define=BALNANA_EXTERNAL_PAYMENTS=true
```

APK 会生成在 `build/app/outputs/flutter-apk/app-<flavor>-release.apk`。

## 创建上传密钥

正式版以你自己的上传密钥签名。只需创建一次，并妥善保管它与它的密码：之后每次更新都必须用同一把密钥签名。

```bash
keytool -genkeypair -v -keystore ~/balnana-upload.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

接着创建 `app/android/key.properties`（git 会忽略它）：

```properties
storeFile=/home/you/balnana-upload.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

`storeFile` 也可以是相对于 `app/android/` 的路径。之后 `flutter build apk --release`（或 `appbundle --flavor play`）就会用这把密钥签名。没有 `key.properties` 时，正式版构建会报错中止。

若只是想试试正式版 APK，可以用调试密钥签名：

```bash
flutter build apk --release --android-project-arg=allowDebugSigning=true
```

:::caution
以调试密钥签名的 APK 无法更新已安装、正式签名的 App，反之亦然。
:::

## 上架检查清单

Google Play 等应用商店会要求一些代码无法提供的东西：

- **默认服务器。** 以 `--dart-define=BALNANA_SERVER_URL=https://...` 构建，用户第一次启动时就不必输入网址。
- **隐私政策网址**，必须公开且无需登录即可访问：把 `BALNANA_PRIVACY_URL` 设为你的政策，或向商店提供 `<server>/privacy`，也就是内置声明。
- **账号删除网址**（账号模式）：`<server>/delete-account`。
- App bundle 的**正式密钥**：没有它 `flutter build appbundle --flavor play` 会拒绝构建。若使用 Play 应用签名，也请把 Play 应用签名证书的指纹加到 `BALNANA_ANDROID_CERT_SHA256`，让 [App 链接](/docs/zh-hans/apps/connecting/#app-链接)继续工作。
- **数据安全表单。** 服务器会存储名称、电子邮件地址、群组的支出与收据照片、成员填写的收款信息，以及（启用推送通知时）每部手机提供的推送服务地址。支出也可能包含地名与坐标。App 只有在点按“使用当前位置”后才会请求位置权限，且只有在用户保留该地点并保存支出时才会存下。地图会从运营者选择的提供商加载瓦片，提供商会收到设备的网络地址与所请求的地图范围。App 会在手机上保留一份群组数据供离线使用，离线时添加的支出与转账也会存在手机上，直到上传为止。主屏幕小组件会显示用户选择的群组名称，以及他在该群组的余额。

## F-Droid

`foss` 构建不含任何专有库，因此可以为 F-Droid 构建；F-Droid 的构建配置必须指定 `foss` flavor。不过在没有安装其他分发器时，它内置的推送分发器仍会使用 Google 的 Firebase Cloud Messaging 网络服务，F-Droid 可能会将此标记为反特性（anti-feature）。
