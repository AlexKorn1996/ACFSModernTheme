
{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * ACFSModern theme navigation menu template
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}

			{* Елемент списку з підтримкою наведення для випадаючих меню *}
			<li class="{$liClass|escape} relative group {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}">
				<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					class="inline-flex items-center gap-1 transition-colors hover:text-brand-900"
					{if $hasChildren}
						aria-haspopup="true"
						aria-expanded="false"
					{/if}
				>
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
					
					{* Додаємо стрілочку, якщо є підменю *}
					{if $hasChildren}
						<i class="ph ph-caret-down text-[10px] transition-transform group-hover:rotate-180"></i>
					{/if}
				</a>

				{* Випадаюче меню (Dropdown) *}
				{if $hasChildren}
					<div class="absolute left-0 mt-2 w-56 bg-white border border-slate-100 rounded-md shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
						<div class="py-1">
							{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
								{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
									<a class="block px-4 py-2 text-sm text-slate-600 hover:bg-slate-50 hover:text-brand-900 transition-colors" 
									   href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a>
								{/if}
							{/foreach}
						</div>
					</div>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}
