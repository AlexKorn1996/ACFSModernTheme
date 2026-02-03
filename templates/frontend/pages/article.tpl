{**
 * templates/frontend/pages/article.tpl
 *
 * ACFSModern article details page
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$article->getLocalizedTitle()|strip_tags}

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="flex flex-col lg:flex-row gap-12">
        
        <div class="lg:w-2/3">
            {* Метаданные статьи *}
            <div class="flex items-center gap-3 text-xs font-bold text-brand-accent uppercase tracking-widest mb-4">
                <span>{$section->getLocalizedTitle()|escape}</span>
                {if $article->getStoredPubId('doi')}
                    <span class="text-slate-300">|</span>
                    <span class="text-slate-400">DOI: {$article->getStoredPubId('doi')|escape}</span>
                {/if}
            </div>
            
            <h1 class="text-3xl md:text-4xl font-serif font-bold text-slate-900 mb-6 leading-tight">
                {$article->getLocalizedTitle()|strip_tags}
            </h1>

            <div class="text-lg text-slate-700 font-medium mb-8 pb-8 border-b border-slate-100">
                {$article->getAuthorString()|escape}
            </div>

            {* Аннотация *}
            <section class="prose prose-slate max-w-none">
                <h3 class="font-serif text-xl font-bold text-brand-900 mb-4">{translate key="article.abstract"}</h3>
                <div class="text-slate-600 leading-relaxed text-justify">
                    {$article->getLocalizedAbstract()|strip_tags|nl2br}
                </div>
            </section>
        </div>

        {* Панель действий (PDF, Цитирование) *}
        <aside class="lg:w-1/3 space-y-6">
            <div class="bg-brand-900 text-white p-6 rounded-lg shadow-lg">
                <h4 class="font-bold mb-4 uppercase text-[10px] tracking-widest text-brand-accent border-b border-white/10 pb-2">Full Text</h4>
                <div class="space-y-3">
                    {foreach from=$article->getGalleys() item=galley}
                        <a class="flex items-center justify-between bg-white/10 hover:bg-white/20 p-3 rounded transition group" 
                           href="{url page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}">
                            <span class="font-semibold text-sm">{$galley->getGalleyLabel()|escape}</span>
                            <i class="ph ph-file-pdf text-xl group-hover:scale-110 transition"></i>
                        </a>
                    {/foreach}
                </div>
            </div>

            {* Информация о выпуске *}
            <div class="bg-white p-6 rounded-lg border border-slate-200">
                <h4 class="text-xs font-bold text-slate-400 uppercase tracking-widest mb-4">Issue</h4>
                <a href="{url page="issue" op="view" path=$issue->getBestIssueId()}" class="font-serif font-bold text-slate-900 hover:text-brand-accent transition">
                    {$issue->getIssueIdentification()|escape}
                </a>
            </div>
        </aside>

    </div>
</div>

{include file="frontend/components/footer.tpl"}
