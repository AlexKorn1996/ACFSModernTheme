{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * ACFSModern theme issue archive page
 *}
{include file="frontend/components/header.tpl" pageTitle="navigation.archives"}

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
    <h1 class="text-4xl font-serif font-bold text-slate-900 mb-12 border-b border-slate-200 pb-6">
        {translate key="navigation.archives"}
    </h1>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        {foreach from=$issues item=issue}
            <div class="group bg-white rounded-lg border border-slate-200 overflow-hidden hover:shadow-md transition">
                {if $issue->getLocalizedCoverReference()}
                    <a href="{url op="view" path=$issue->getBestIssueId()}">
                        <img class="w-full h-72 object-cover transition-transform duration-500 group-hover:scale-105" 
                             src="{$issue->getLocalizedCoverImageUrl()|escape}" 
                             alt="{$issue->getIssueIdentification()|escape}">
                    </a>
                {/if}
                <div class="p-6">
                    <h2 class="font-serif text-xl font-bold text-slate-900 group-hover:text-brand-900 transition mb-2">
                        <a href="{url op="view" path=$issue->getBestIssueId()}">
                            {$issue->getIssueIdentification()|escape}
                        </a>
                    </h2>
                    <p class="text-sm text-slate-500 line-clamp-2">
                        {$issue->getLocalizedDescription()|strip_tags}
                    </p>
                </div>
            </div>
        {/foreach}
    </div>

    {* Пагінація OJS *}
    {if $prevPage || $nextPage}
        <div class="mt-12 flex justify-center gap-4">
            {if $prevPage}
                <a href="{url op="archive" path=$prevPage}" class="px-6 py-2 border border-slate-200 rounded-full hover:bg-slate-50 transition text-sm font-bold">
                    <i class="ph ph-arrow-left"></i> {translate key="common.newer"}
                </a>
            {/if}
            {if $nextPage}
                <a href="{url op="archive" path=$nextPage}" class="px-6 py-2 border border-slate-200 rounded-full hover:bg-slate-50 transition text-sm font-bold">
                    {translate key="common.older"} <i class="ph ph-arrow-right"></i>
                </a>
            {/if}
        </div>
    {/if}
</div>

{include file="frontend/components/footer.tpl"}
