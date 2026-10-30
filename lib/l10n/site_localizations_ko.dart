// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class SiteLocalizationsKo extends SiteLocalizations {
  SiteLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get navFeatures => '기능';

  @override
  String get navDemo => '체험하기';

  @override
  String get navHosting => '직접 호스팅';

  @override
  String get navFaq => '자주 묻는 질문';

  @override
  String get navDocs => '문서';

  @override
  String get heroEyebrow => '오픈 소스. 관리는 내 손에.';

  @override
  String get heroTitle => '즐거운 시간.\n깔끔한 정산.';

  @override
  String get heroBody => '여행, 식사, 일상까지. 공동 지출을 정리하고 직접 관리하는 서버에 데이터를 보관하세요.';

  @override
  String get tryDemo => '데모 체험';

  @override
  String get selfHost => 'Balnana 직접 호스팅';

  @override
  String get development => '개발 중 · Android + Web';

  @override
  String get trustSplit => '유연한 분담';

  @override
  String get trustLanguages => '20개 언어';

  @override
  String get trustOpen => '오픈 소스. 광고 없음.';

  @override
  String get trustServer => '나만의 서버';

  @override
  String get demoLabel => '함께 체험해 보세요';

  @override
  String get demoTitle => '계획은 자유롭게.\n계산은 맡기세요.';

  @override
  String get demoBody => '금액과 결제한 사람을 바꿔 정산 결과를 확인하세요.';

  @override
  String get scenarioTravel => '여행';

  @override
  String get scenarioHome => '룸메이트';

  @override
  String get scenarioDinner => '식사';

  @override
  String get groupTravel => '교토의 주말';

  @override
  String get groupHome => '우리 집';

  @override
  String get groupDinner => '금요일 저녁';

  @override
  String get demoNotice => '인터랙티브 데모 · 가상 데이터';

  @override
  String get payer => '누가 결제했나요?';

  @override
  String get balances => '모두의 잔액';

  @override
  String get payments => '추천 송금';

  @override
  String morePayments(int count) {
    return '외 $count건';
  }

  @override
  String get reset => '데모 초기화';

  @override
  String get weightedHelp => '각자 부담할 몫을 정하세요. 0이면 제외됩니다.';

  @override
  String fewerShares(String name) {
    return '$name의 몫 줄이기';
  }

  @override
  String moreShares(String name) {
    return '$name의 몫 늘리기';
  }

  @override
  String get featureLabel => '작은 배려, 큰 차이';

  @override
  String get featureTitle => '계산은 줄이고.\n함께하는 시간은 늘리고.';

  @override
  String get featureSplitTitle => '공평이 꼭 똑같음을 뜻하진 않죠.';

  @override
  String get featureSplitBody => '균등, 금액 지정, 몫으로 나누세요. 한 지출을 여러 사람이 결제할 수도 있어요.';

  @override
  String get featureSettleTitle => '더 명확한 정산.';

  @override
  String get featureSettleBody => '누가 누구에게 얼마를 줄지 확인하고 송금 횟수를 줄이는 제안을 받아보세요.';

  @override
  String get travelLabel => '다음 여행을 위해';

  @override
  String get travelTitle => '통화는 달라도.\n좋은 친구는 그대로.';

  @override
  String get travelBody => '원래 통화를 보관하고 환율이나 카드 청구액을 입력하세요. 잔액은 그룹 통화로 정리됩니다.';

  @override
  String get screenshotsNote => '실제 Android 화면 · 가상 데이터 · 영어';

  @override
  String get screenshotExpenses => '모든 지출';

  @override
  String get screenshotForeign => '원래 통화';

  @override
  String get screenshotStats => '지출 분석';

  @override
  String get extraTitle => '그룹에 필요한 모든 것.';

  @override
  String get recurringTitle => '반복되는 일상 지출.';

  @override
  String get recurringBody => '월세 등 정기 지출을 예약하세요.';

  @override
  String get receiptsTitle => '세부 정보도 함께.';

  @override
  String get receiptsBody => '영수증을 첨부하고 지출 장소를 남기세요.';

  @override
  String get liveTitle => '언제나 같은 장부.';

  @override
  String get liveBody => '다른 사람이 지출을 추가하면 열려 있는 그룹이 업데이트됩니다.';

  @override
  String get exportTitle => '기록을 자유롭게.';

  @override
  String get exportBody => 'CSV 내보내기와 Settle Up 그룹 가져오기를 지원합니다.';

  @override
  String get hostingLabel => '나의 사람들. 나의 서버.';

  @override
  String get hostingTitle => '나의 장부.\n나의 방식으로.';

  @override
  String get hostingBody => 'Docker Compose와 PostgreSQL로 운영하세요. 그룹의 장부를 어디에 보관할지 직접 결정합니다.';

  @override
  String get hostingLink => '설치 안내 읽기';

  @override
  String get hostingModeLink => '링크 모드에서는 비공개 링크만 공유하면 됩니다. 가입이 필요 없어요.';

  @override
  String get hostingModeAccounts => '비밀번호, Google, OIDC 계정 로그인도 설정할 수 있어요.';

  @override
  String get faqTitle => '자주 묻는 질문';

  @override
  String get faqAccountQ => '모두 계정이 필요한가요?';

  @override
  String get faqAccountA => '링크 모드에서는 비공개 링크나 QR 코드만 있으면 됩니다. 계정 모드의 접근 권한은 서버 설정에 따라 달라집니다.';

  @override
  String get faqOfflineQ => '오프라인에서도 되나요?';

  @override
  String get faqOfflineA =>
      'Android에서는 서버에 연결할 수 없어도 캐시된 그룹과 지출을 읽을 수 있습니다. 추가하거나 수정하려면 연결이 필요합니다.';

  @override
  String get faqCurrencyQ => '환율은 자동인가요?';

  @override
  String get faqCurrencyA => '직접 환율을 입력하거나 실제 카드 청구액을 입력하세요. 실시간 환율을 가져오지는 않습니다.';

  @override
  String get faqPlatformQ => '어떤 플랫폼을 지원하나요?';

  @override
  String get faqPlatformA => '현재 Android와 웹을 지원합니다. iOS 버전은 아직 없습니다.';

  @override
  String get faqCostQ => 'Balnana는 무료인가요?';

  @override
  String get faqCostA => 'AGPL-3.0 오픈 소스입니다. 앱 구독료는 없지만 직접 서버를 운영하면 호스팅 비용이 들 수 있습니다.';

  @override
  String get endTitle => '다음 즐거운 만남은\n여기서 시작하세요.';

  @override
  String get endBody => '친구들을 모으세요. 숫자는 함께 정리해요.';

  @override
  String get github => '소스 보기';

  @override
  String get reportIssue => '문제 신고';

  @override
  String get footerNote => '함께 나누기 위한 오픈 소스 프로젝트.';

  @override
  String get backHome => '홈으로';

  @override
  String get notFound => '페이지를 찾을 수 없어요.';

  @override
  String get screenshotOpen => '스크린샷 보기';

  @override
  String get settled => '모두 정산을 마쳤어요.';

  @override
  String get retry => '다시 시도';

  @override
  String owed(String name) {
    return '$name님이 받을 돈';
  }

  @override
  String get languageEndonym => '한국어';

  @override
  String get languageLabel => '언어';

  @override
  String get themeLabel => '테마';

  @override
  String get themeSystem => '시스템 기본값';

  @override
  String get themeLight => '밝게';

  @override
  String get themeDark => '어둡게';

  @override
  String get amountLabel => '금액';

  @override
  String get splitEqual => '똑같이';

  @override
  String get splitShares => '분담 비율';

  @override
  String get cancel => '취소';

  @override
  String get invalidAmount => '0보다 큰 금액을 입력해 주세요.';

  @override
  String get amountTooLarge => '금액이 너무 커요.';
}
