<article class="group bg-white p-6 rounded-lg shadow-sm border border-slate-200 hover:shadow-md transition mb-6">
    <div class="flex flex-col sm:flex-row gap-6">
        <div class="flex-grow">

            {* Section + Date *}
            <div class="flex items-center gap-3 text-xs text-slate-400 mb-2">
                {if isset($section)}
                    {if is_object($section) && method_exists($section, 'getLocalizedTitle')}
                        <span class="font-semibold text-brand-accent uppercase tracking-wider">{$section->getLocalizedTitle()|escape}</span>
                        <span>•</span>
                    {elseif isset($section.localizedTitle)}
                        <span class="font-semibold text-brand-accent uppercase tracking-wider">{$section.localizedTitle|escape}</span>
                        <span>•</span>
                    {/if}
                {/if}

                {* Date Published *}
                {assign var=datePublished value=""}
                {if is_object($article) && method_exists($article, 'getDatePublished')}
                    {assign var=datePublished value=$article->getDatePublished()}
                {elseif isset($article.datePublished)}
                    {assign var=datePublished value=$article.datePublished}
                {/if}
                {if $datePublished}<span>{$datePublished|date_format:$dateFormatShort}</span>{/if}
            </div>

            {* Title *}
            {assign var=articleId value=""}
            {if is_object($article) && method_exists($article, 'getBestArticleId')}
                {assign var=articleId value=$article->getBestArticleId()}
            {elseif isset($article.id)}
                {assign var=articleId value=$article.id}
            {/if}

            <h4 class="font-serif text-xl font-bold text-slate-900 group-hover:text-brand-900 transition mb-2">
                <a href="{url page='article' op='view' path=$articleId}">
                    {if is_object($article) && method_exists($article, 'getLocalizedTitle')}
                        {$article->getLocalizedTitle()|strip_tags}
                    {elseif isset($article.title)}
                        {$article.title|strip_tags}
                    {/if}
                </a>
            </h4>

            {* Authors *}
            <div class="text-sm font-medium text-slate-700 mb-3">
                {if is_object($article) && method_exists($article, 'getAuthorString')}
                    {$article->getAuthorString()|escape}
                {elseif isset($article.authorsString)}
                    {$article.authorsString|escape}
                {/if}
            </div>

            {* DOI + Galleys *}
            <div class="flex items-center justify-between mt-4">
                {* DOI *}
                <div class="text-xs text-slate-400">
                    {assign var=doi value=""}
                    {if is_object($article) && method_exists($article, 'getCurrentPublication')}
                        {assign var=pub value=$article->getCurrentPublication()}
                        {if is_object($pub) && method_exists($pub, 'getDoi')}
                            {assign var=doi value=$pub->getDoi()}
                        {/if}
                    {elseif isset($article.doi)}
                        {assign var=doi value=$article.doi}
                    {/if}
                    {if $doi}<span class="font-bold">DOI:</span> {$doi|escape}{/if}
                </div>

                {* Galleys *}
                <div class="flex gap-3">
                    {assign var=galleys value=[]}
                    {if is_object($article) && method_exists($article, 'getGalleys')}
                        {assign var=galleys value=$article->getGalleys()}
                    {elseif isset($article.galleys)}
                        {assign var=galleys value=$article.galleys}
                    {/if}

                    {foreach from=$galleys item=galley}
                        {assign var=galleyId value=""}
                        {if is_object($galley) && method_exists($galley, 'getBestGalleyId')}
                            {assign var=galleyId value=$galley->getBestGalleyId()}
                        {elseif isset($galley.id)}
                            {assign var=galleyId value=$galley.id}
                        {/if}

                        {assign var=galleyLabel value=""}
                        {if is_object($galley) && method_exists($galley, 'getGalleyLabel')}
                            {assign var=galleyLabel value=$galley->getGalleyLabel()}
                        {elseif isset($galley.label)}
                            {assign var=galleyLabel value=$galley.label}
                        {/if}

                        {if $articleId && $galleyId}
                            <a
                                class="flex items-center gap-1 text-xs font-bold text-slate-500 hover:text-red-700 transition bg-slate-50 px-2 py-1 rounded border border-slate-100"
                                href="{url page='article' op='view' path=$articleId|to_array:$galleyId}"
                            >
                                <i class="ph ph-file-pdf text-lg"></i>
                                {$galleyLabel|escape}
                            </a>
                        {/if}
                    {/foreach}
                </div>
            </div>

        </div>
    </div>
</article>
