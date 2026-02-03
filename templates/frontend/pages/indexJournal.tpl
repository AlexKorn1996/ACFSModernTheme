{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * ACFSModern theme journal index page
 *}
{include file="frontend/components/header.tpl"}

<div class="page_index_journal">

	{* HERO SECTION из вашего концепта *}
	<section class="bg-white border-b border-slate-200">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 md:py-24 grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
			
			<div class="space-y-6">
				<span class="inline-block py-1 px-3 rounded bg-blue-50 text-blue-800 text-xs font-bold tracking-wide uppercase mb-2">
					Open Access Journal
				</span>
				<h2 class="text-4xl md:text-5xl font-serif font-bold text-slate-900 leading-tight">
					{$displayPageHeaderTitle}
				</h2>
				<p class="text-lg text-slate-500 leading-relaxed max-w-lg">
					{$journalDescription|strip_tags|truncate:250}
				</p>
				<div class="flex flex-wrap gap-4 pt-2">
					{if $issue}
						<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}" class="bg-brand-accent hover:bg-yellow-600 text-white px-6 py-3 rounded text-sm font-semibold transition flex items-center gap-2">
							{translate key="journal.currentIssue"}
							<i class="ph ph-arrow-right"></i>
						</a>
					{/if}
					<a href="{url page="about" op="submissions"}" class="text-slate-600 hover:text-slate-900 px-6 py-3 rounded text-sm font-semibold border border-slate-200 hover:border-slate-400 transition">
						{translate key="about.submissions"}
					</a>
				</div>
			</div>

			<div class="relative hidden md:block">
				<div class="absolute -inset-4 bg-gradient-to-tr from-slate-100 to-white rounded-full opacity-50 blur-2xl"></div>
				
				{* Карточка последнего выпуска или анонс *}
				<div class="relative bg-white p-6 rounded-xl shadow-soft border border-slate-100 max-w-sm ml-auto rotate-1 hover:rotate-0 transition duration-500">
					<div class="flex justify-between items-start mb-4">
						<span class="text-xs font-bold text-slate-400 uppercase tracking-widest">{translate key="journal.currentIssue"}</span>
						{if $issue && $issue->getSeriesDisplay()}
							<span class="bg-brand-light text-brand-900 text-[10px] px-2 py-0.5 rounded font-bold">{$issue->getSeriesDisplay()}</span>
						{/if}
					</div>
					<h3 class="font-serif text-xl font-bold text-slate-900 mb-3">
						{if $issue}{$issue->getLocalizedTitle()}{else}ACFS Journal{/if}
					</h3>
					<p class="text-slate-500 text-sm mb-4">
						{if $issue}{$issue->getLocalizedDescription()|strip_tags|truncate:120}{/if}
					</p>
					<div class="flex gap-6 text-center border-t border-slate-50 pt-4">
						<div>
							<div class="text-xl font-bold text-brand-900">A</div>
							<div class="text-[10px] text-slate-400 uppercase tracking-wide">Category</div>
						</div>
						<div class="w-px bg-slate-100"></div>
						<div>
							<div class="text-xl font-bold text-brand-900">ISSN</div>
							<div class="text-[10px] text-slate-400 uppercase tracking-wide">1993-0917</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-16">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="flex flex-col lg:flex-row gap-12">
				
				<div class="lg:w-2/3 space-y-8">
					<div class="flex justify-between items-end border-b border-slate-200 pb-4">
						<h3 class="font-serif text-2xl font-bold text-slate-900">{translate key="journal.publications"}</h3>
						<a href="{url page="issue" op="archive"}" class="text-sm text-brand-accent font-semibold hover:text-brand-800 transition">
							{translate key="navigation.archives"}
						</a>
					</div>

					{* Список статей из текущего выпуска *}
					{if $issue}
						<div class="sections">
						{foreach from=$publishedSubmissions item=article}
							{include file="frontend/objects/article_summary.tpl" article=$article}
						{/foreach}
						</div>
					{else}
						<p class="text-slate-500 italic">Пока нет опубликованных материалов.</p>
					{/if}
				</div>

				<aside class="lg:w-1/3 space-y-8">
					{include file="frontend/components/sidebar.tpl"}
				</aside>
			</div>
		</div>
	</section>

</div>

{include file="frontend/components/footer.tpl"}
