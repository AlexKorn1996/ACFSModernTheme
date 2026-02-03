{**
 * templates/frontend/pages/submissions.tpl
 *
 * ACFSModern author guidelines page
 *}
{include file="frontend/components/header.tpl" pageTitle="about.submissions"}

<div class="max-w-4xl mx-auto px-4 py-16">
    <article class="prose prose-slate max-w-none">
        <h1 class="font-serif font-bold text-slate-900 tracking-tight mb-8">
            {translate key="about.submissions"}
        </h1>
        
        {* Блок реєстрації *}
        <div class="bg-brand-light border-l-4 border-brand-accent p-6 my-10 rounded-r shadow-sm">
            <div class="flex gap-4">
                <i class="ph ph-user-plus text-2xl text-brand-900"></i>
                <div>
                    <p class="text-brand-900 font-medium m-0 leading-relaxed">
                        {translate key="about.onlineSubmissions.registrationRequired"}
                    </p>
                    <div class="mt-4 flex gap-4">
                        <a href="{url page="user" op="register"}" class="font-bold text-brand-900 hover:text-brand-accent transition">
                            {translate key="about.onlineSubmissions.register"} →
                        </a>
                        <a href="{url page="login"}" class="text-sm text-slate-500 hover:text-brand-900 transition">
                            {translate key="about.onlineSubmissions.login"}
                        </a>
                    </div>
                </div>
            </div>
        </div>

        {* Правила для авторів *}
        {if $currentContext->getLocalizedData('authorGuidelines')}
            <section class="mt-12 pt-8 border-t border-slate-100">
                <h2 class="font-serif text-2xl font-bold text-slate-900 mb-6">
                    {translate key="about.authorGuidelines"}
                </h2>
                <div class="text-slate-600 leading-relaxed text-justify">
                    {$currentContext->getLocalizedData('authorGuidelines')}
                </div>
            </section>
        {/if}

        {* Положення про конфіденційність *}
        {if $currentContext->getLocalizedData('privacyStatement')}
            <section class="mt-12 pt-8 border-t border-slate-100">
                <h3 class="font-serif text-xl font-bold text-slate-900 mb-4">
                    {translate key="about.privacyStatement"}
                </h3>
                <div class="text-slate-500 text-sm">
                    {$currentContext->getLocalizedData('privacyStatement')|nl2br}
                </div>
            </section>
        {/if}
    </article>
</div>

{include file="frontend/components/footer.tpl"}
