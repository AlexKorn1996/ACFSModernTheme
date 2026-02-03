{**
 * templates/frontend/pages/about.tpl
 *
 * ACFSModern "About the Journal" page
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

<div class="max-w-4xl mx-auto px-4 py-16">
    <div class="prose prose-slate max-w-none">
        <h1 class="font-serif font-bold text-slate-900 tracking-tight mb-8">
            {translate key="about.aboutContext"}
        </h1>
        
        <div class="text-slate-600 leading-relaxed space-y-6">
            {$currentContext->getLocalizedData('description')}
        </div>

        {if $currentContext->getLocalizedData('editorialTeam')}
            <section class="mt-12 pt-12 border-t border-slate-100">
                <h2 class="font-serif text-2xl font-bold text-brand-900 mb-6">{translate key="about.editorialTeam"}</h2>
                <div class="text-slate-600">
                    {$currentContext->getLocalizedData('editorialTeam')}
                </div>
            </section>
        {/if}
    </div>
</div>

{include file="frontend/components/footer.tpl"}
