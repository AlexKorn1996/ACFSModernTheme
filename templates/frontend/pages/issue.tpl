{**
 * templates/frontend/pages/issue.tpl
 *
 * ACFSModern theme issue page (Table of Contents)
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    {* Заголовок выпуска *}
    <div class="border-b border-slate-200 pb-8 mb-12">
        <div class="text-brand-accent font-bold text-xs uppercase tracking-widest mb-2">
            {translate key="issue.issue"}
        </div>
        <h1 class="text-3xl md:text-4xl font-serif font-bold text-slate-900 mb-4">
            {$issueIdentification|escape}
        </h1>
        {if $issue->getLocalizedDescription()}
            <div class="text-slate-600 leading-relaxed max-w-3xl prose prose-slate">
                {$issue->getLocalizedDescription()|strip_tags}
            </div>
        {/if}
    </div>

    <div class="flex flex-col lg:flex-row gap-12">
        {* Список статей *}
        <div class="lg:w-2/3 space-y-6">
            {if $publishedSubmissions|@count > 0}
                {include file="frontend/objects/issue_toc.tpl" issue=$issue publishedSubmissions=$publishedSubmissions}
            {else}
                <p class="text-slate-500 italic">{translate key="article.noArticlesPublished"}</p>
            {/if}
        </div>

        {* Сайдбар с обложкой выпуска *}
        <aside class="lg:w-1/3 space-y-8">
            {if $issue->getLocalizedCoverImageUrl()}
                <div class="bg-white p-4 rounded-lg shadow-soft border border-slate-100">
                    <img class="w-full h-auto rounded shadow-sm" src="{$issue->getLocalizedCoverImageUrl()|escape}" alt="{$issueIdentification|escape}">
                </div>
            {/if}

            {include file="frontend/components/sidebar.tpl"}
        </aside>
    </div>
</div>

{include file="frontend/components/footer.tpl"}