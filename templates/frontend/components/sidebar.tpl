{**
 * templates/frontend/components/sidebar.tpl
 *
 * ACFSModern theme sidebar component
 *}
<aside class="space-y-8">
    
    <div class="bg-white p-6 rounded-lg shadow-sm border border-slate-200">
        <h4 class="font-bold text-slate-900 mb-4">{translate key="common.search"}</h4>
        <form class="relative" method="post" action="{url page="search"}">
            <input type="text" name="query" placeholder="{translate key="common.search"}..." 
                   class="w-full pl-10 pr-4 py-2 bg-slate-50 border border-slate-200 rounded text-sm focus:outline-none focus:border-brand-900 transition">
            <button type="submit" class="absolute left-3 top-2.5 text-slate-400">
                <i class="ph ph-magnifying-glass"></i>
            </button>
        </form>
    </div>

    <div class="bg-brand-900 text-white p-6 rounded-lg shadow-lg relative overflow-hidden">
        <div class="absolute top-0 right-0 -mt-2 -mr-2 w-16 h-16 bg-white opacity-10 rounded-full"></div>
        <h4 class="font-bold text-lg mb-2 relative z-10">{translate key="announcement.announcements"}</h4>
        <p class="text-slate-300 text-sm mb-4 relative z-10">
            Відкрито прийом матеріалів до наступних випусків 2026 року.
        </p>
        <a href="{url page="submission" op="wizard"}" class="block text-center w-full py-2 bg-white text-brand-900 font-bold text-sm rounded hover:bg-slate-100 transition relative z-10">
            {translate key="about.onlineSubmissions.submitArticle"}
        </a>
    </div>

    <div class="sidebar_blocks">
        {call_hook name="Templates::Common::Sidebar"}
    </div>

    <div class="bg-white p-6 rounded-lg shadow-sm border border-slate-200">
        <h4 class="font-bold text-slate-900 mb-4 border-b border-slate-100 pb-2">{translate key="navigation.infoFor"}</h4>
        <ul class="space-y-2 text-sm text-slate-600">
            <li>
                <a href="{url page="information" op="readers"}" class="hover:text-brand-accent flex justify-between items-center group">
                    <span>{translate key="navigation.infoFor.readers"}</span>
                    <i class="ph ph-arrow-right text-[10px] opacity-0 group-hover:opacity-100 transition"></i>
                </a>
            </li>
            <li>
                <a href="{url page="information" op="authors"}" class="hover:text-brand-accent flex justify-between items-center group">
                    <span>{translate key="navigation.infoFor.authors"}</span>
                    <i class="ph ph-arrow-right text-[10px] opacity-0 group-hover:opacity-100 transition"></i>
                </a>
            </li>
            <li>
                <a href="{url page="information" op="librarians"}" class="hover:text-brand-accent flex justify-between items-center group">
                    <span>{translate key="navigation.infoFor.librarians"}</span>
                    <i class="ph ph-arrow-right text-[10px] opacity-0 group-hover:opacity-100 transition"></i>
                </a>
            </li>
        </ul>
    </div>

</aside>
