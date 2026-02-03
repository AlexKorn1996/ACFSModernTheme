{**
 * templates/frontend/components/footer.tpl
 *
 * ACFSModern theme footer
 *}
	</main> {* Закриваємо тег <main>, відкритий у header.tpl *}

    <footer class="bg-slate-900 text-slate-400 py-12 border-t border-slate-800 mt-auto">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-4 gap-8">
            
            <div class="col-span-1 md:col-span-2">
                <h5 class="text-white font-serif font-bold text-lg mb-4">
                    {$displayPageHeaderTitle}
                </h5>
                <p class="text-sm leading-relaxed mb-4 max-w-sm">
                    {if $journalDescription}
                        {$journalDescription|strip_tags|truncate:250}
                    {else}
                        {translate key="journal.about"}
                    {/if}
                </p>
                <div class="flex gap-4">
                    <a href="#" class="hover:text-white transition"><i class="ph ph-facebook-logo text-xl"></i></a>
                    <a href="#" class="hover:text-white transition"><i class="ph ph-twitter-logo text-xl"></i></a>
                    <a href="#" class="hover:text-white transition"><i class="ph ph-linkedin-logo text-xl"></i></a>
                </div>
            </div>
            
            <div>
                <h5 class="text-white font-bold text-sm uppercase tracking-wider mb-4">
                    {translate key="navigation.infoFor"}
                </h5>
                <ul class="space-y-2 text-sm">
                    <li><a href="{url page="about" op="editorialPolicies"}" class="hover:text-brand-accent transition">Редакційна політика</a></li>
                    <li><a href="{url page="about" op="submissions" anchor="publicationEthics"}" class="hover:text-brand-accent transition">Етика публікацій</a></li>
                    <li><a href="{url page="about" op="submissions" anchor="peerReviewProcess"}" class="hover:text-brand-accent transition">Рецензування</a></li>
                    <li><a href="{url page="about" op="contact"}" class="hover:text-brand-accent transition">{translate key="about.contact"}</a></li>
                </ul>
            </div>

            <div>
                <h5 class="text-white font-bold text-sm uppercase tracking-wider mb-4">Indexing</h5>
                <div class="flex flex-wrap gap-2">
                    <span class="px-2 py-1 bg-slate-800 rounded text-[10px] font-bold border border-slate-700 uppercase">Scopus</span>
                    <span class="px-2 py-1 bg-slate-800 rounded text-[10px] font-bold border border-slate-700 uppercase">Web of Science</span>
                    <span class="px-2 py-1 bg-slate-800 rounded text-[10px] font-bold border border-slate-700 uppercase">Google Scholar</span>
                    <span class="px-2 py-1 bg-slate-800 rounded text-[10px] font-bold border border-slate-700 uppercase">Index Copernicus</span>
                </div>
            </div>
        </div>

        <div class="max-w-7xl mx-auto px-4 mt-12 pt-8 border-t border-slate-800 text-xs text-center">
            <p>
                &copy; {$smarty.now|date_format:"%Y"} {$displayPageHeaderTitle|escape}. 
                {translate key="common.allRightsReserved"}
            </p>
            <p class="mt-2 opacity-50">
                {translate key="about.aboutThisPublishingSystem"}
            </p>
        </div>
    </footer>

    {* Підключаємо системні скрипти OJS перед закриттям body *}
    
   


</body>
</html>
