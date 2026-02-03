{**
 * templates/frontend/objects/article_summary.tpl
 *
 * ACFSModern article summary (list item)
 *}
<article class="group bg-white p-6 rounded-lg shadow-sm border border-slate-200 hover:shadow-md transition mb-6">
    <div class="flex flex-col sm:flex-row gap-6">
        <div class="flex-grow">
            {* Категория и Дата *}
            <div class="flex items-center gap-3 text-xs text-slate-400 mb-2">
                {if $article->getSectionTitle()}
                    <span class="font-semibold text-brand-accent uppercase tracking-wider">{$article->getSectionTitle()|escape}</span>
                    <span>•</span>
                {/if}
                <span>{$article->getDatePublished()|date_format:$dateFormatShort}</span>
            </div>

            {* Заголовок *}
            <h4 class="font-serif text-xl font-bold text-slate-900 group-hover:text-brand-900 transition mb-2">
                <a href="{url page="article" op="view" path=$article->getBestId()}">
                    {$article->getLocalizedTitle()|strip_tags}
                </a>
            </h4>

            {* Авторы *}
            <div class="text-sm font-medium text-slate-700 mb-3">
                {$article->getAuthorString()|escape}
            </div>

            {* DOI и Кнопки *}
            <div class="flex items-center justify-between mt-4">
                <div class="text-xs text-slate-400">
                    {if $article->getStoredPubId('doi')}
                        <span class="font-bold">DOI:</span> {$article->getStoredPubId('doi')|escape}
                    {/if}
                </div>
                
                <div class="flex gap-3">
                    {* Кнопки PDF файлов *}
                    {foreach from=$article->getGalleys() item=galley}
                        <a class="flex items-center gap-1 text-xs font-bold text-slate-500 hover:text-red-700 transition bg-slate-50 px-2 py-1 rounded border border-slate-100" 
                           href="{url page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}">
                            <i class="ph ph-file-pdf text-lg"></i> {$galley->getGalleyLabel()|escape}
                        </a>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</article>
