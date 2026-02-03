{**
 * templates/frontend/pages/search.tpl
 *
 * ACFSModern search results page
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
    {* Форма пошуку *}
    <div class="bg-white p-8 rounded-lg border border-slate-100 shadow-soft mb-12">
        <form method="post" action="{url op="search"}" class="flex flex-col md:flex-row gap-4">
            <div class="flex-grow relative">
                <i class="ph ph-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-slate-400"></i>
                <input type="text" name="query" value="{$searchQuery|escape}" 
                       class="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded outline-none focus:border-brand-900 transition" 
                       placeholder="{translate key="common.search"}...">
            </div>
            <button type="submit" class="bg-brand-900 text-white px-8 py-4 rounded font-bold hover:bg-brand-800 transition shadow-lg">
                {translate key="common.search"}
            </button>
        </form>
    </div>

    <div class="flex flex-col lg:flex-row gap-12">
        <div class="lg:w-2/3 space-y-8">
            <h3 class="font-serif text-2xl font-bold text-slate-900 pb-4 border-b border-slate-100">
                {translate key="common.search.results"}
            </h3>

            {if $results->count()}
                {iterate from=results item=result}
                    {include file="frontend/objects/article_summary.tpl" article=$result.publishedSubmission}
                {/iterate}
            {else}
                <div class="text-slate-500 italic py-8">
                    {translate key="common.noResults"}
                </div>
            {/if}
        </div>

        <aside class="lg:w-1/3">
            {include file="frontend/components/sidebar.tpl"}
        </aside>
    </div>
</div>

{include file="frontend/components/footer.tpl"}
