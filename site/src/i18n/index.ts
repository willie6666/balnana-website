import en from './en.json' with { type: 'json' };
import zh from './zh.json' with { type: 'json' };
import zhHant from './zh-Hant.json' with { type: 'json' };

export { fill } from './fill.ts';

export type Messages = typeof en;
export type Lang = 'en' | 'zh-Hant' | 'zh';

/**
 * Each language's page lives at `/<lang>`; `/zh` is Simplified and `/zh-Hant` is Traditional.
 * `tag` is the BCP 47 tag the page declares in `lang` and `hreflang`, which names the script for both.
 */
export const languages: Record<Lang, { name: string; tag: string; messages: Messages; ogLocale: string; docs: string }> = {
	en: { name: 'English', tag: 'en', messages: en, ogLocale: 'en_US', docs: '/docs/' },
	'zh-Hant': { name: '繁體中文', tag: 'zh-Hant', messages: zhHant, ogLocale: 'zh_TW', docs: '/docs/zh-hant/' },
	zh: { name: '简体中文', tag: 'zh-Hans', messages: zh, ogLocale: 'zh_CN', docs: '/docs/zh-hans/' },
};

export const langs = Object.keys(languages) as Lang[];

/**
 * The site language for a browser language tag, or undefined when there is none.
 *
 * Chinese resolves by script or region, as in the app: Taiwan, Hong Kong and Macau read Traditional.
 */
export function supportedTag(tag: string | null | undefined): Lang | undefined {
	if (!tag) return undefined;
	const parts = tag.replace(/_/g, '-').toLowerCase().split('-');
	if (parts[0] === 'zh') return parts.some((p) => ['hant', 'tw', 'hk', 'mo'].includes(p)) ? 'zh-Hant' : 'zh';
	return parts[0] === 'en' ? 'en' : undefined;
}

/**
 * Source of a browser expression for the visitor's language: their saved choice, then the
 * browser's languages, then English.
 *
 * It is inlined into the pages that must decide before anything is drawn, and carries
 * `supportedTag`'s own source so the rule lives in one place.
 */
export const preferredLang = `(function(){var pick=${supportedTag},lang;
try{lang=localStorage.getItem('balnana.locale')}catch(e){}
if(${JSON.stringify(langs)}.indexOf(lang)<0){lang=null;var prefs=navigator.languages||[navigator.language];
for(var i=0;i<prefs.length&&!lang;i++)lang=pick(prefs[i])}
return lang||'en'})()`;
