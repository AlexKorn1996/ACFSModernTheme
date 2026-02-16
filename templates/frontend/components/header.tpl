<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}
    {capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}
{/if}
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$pageTitleTranslated|strip_tags}</title>

    {* КРИТИЧЕСКИЙ ВЫЗОВ: 
       Сюда автоматически вставятся Google Fonts, Tailwind (включая ваш inline config) 
        и Phosphor Icons, которые вы зарегистрировали в ACFSModernThemePlugin.inc.php.
    *}
   {* Google Fonts *}
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300&display=swap">

    {* Tailwind CSS *}
    <script src="https://cdn.tailwindcss.com"></script>

    {* Phosphor Icons *}
    <script src="https://unpkg.com/@phosphor-icons/web"></script>

    {* Tailwind config inline *}
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        serif: ['Merriweather', 'serif'],
                    },
                    colors: {
                        brand: {
                            900: '#1a202c',
                            800: '#2d3748',
                            accent: '#C5A572',
                            light: '#f7fafc',
                        }
                    }
                }
            }
        }
    </script>
</head>

<body class="bg-slate-50 text-slate-800 font-sans antialiased flex flex-col min-h-screen">

    {* Верхняя панель информационной поддержки *}
    <div class="bg-brand-900 text-slate-300 text-xs py-2 border-b border-slate-700">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex justify-between items-center">
            <div class="flex items-center space-x-4">
                <span class="flex items-center"><i class="ph ph-check-circle text-brand-accent mr-1"></i>ISSN: 2709-099X</span>
                <span class="hidden sm:inline text-slate-500">|</span>
  <span class="flex items-center"><i class="ph ph-check-circle text-brand-accent mr-1"></i> eISSN: 2709-1007</span>
                <span class="hidden sm:inline text-slate-500">|</span>
                <span class="hidden sm:flex items-center hover:text-white transition cursor-pointer">Внесено до Переліку НФВУ</span>
                <span class="hidden sm:inline text-slate-500">|</span>
                <span class="hidden sm:flex items-center hover:text-white transition cursor-pointer">Категорія "Б"</span>
            </div>
            <div class="flex items-center space-x-4">
                {if $isUserLoggedIn}
                    <a href="{url page="user" op="profile"}" class="hover:text-white transition">{$currentUser->getUsername()|escape}</a>
                    <span class="text-slate-600">|</span>
                    <a href="{url page="login" op="signOut"}" class="hover:text-white transition">{translate key="user.logOut"}</a>
                {else}
                    <a href="{url page="login"}" class="hover:text-white transition">{translate key="about.onlineSubmissions.login"}</a>
                    <span class="text-slate-600">|</span>
                    <a href="{url page="user" op="register"}" class="hover:text-white transition">{translate key="about.onlineSubmissions.register"}</a>
                {/if}
            </div>
        </div>
    </div>

    <header class="bg-white sticky top-0 z-50 shadow-sm border-b border-slate-100">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-20">
                <div class="flex items-center gap-3">
                    <a href="{$baseUrl}" class="flex items-center gap-3 group">
                        <div class="w-10 h-10 bg-brand-900 text-white flex items-center justify-center rounded font-serif font-bold text-xl transition-transform group-hover:scale-105">
                            {if $displayPageHeaderLogo}
                                <img style="max-width: 100%; max-height: 100%;" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle|escape}">
                            {else}
                                K
                            {/if}
                        </div>
                        <div class="leading-tight">
                            <div class="text-xs uppercase tracking-wider text-slate-500 font-semibold">ННЦ «ІСЕ ім. Засл. проф. М. С. Бокаріуса»</div>
                            <h1 class="font-serif font-bold text-lg sm:text-xl text-slate-900 group-hover:text-brand-800 transition">
                                {$displayPageHeaderTitle} <span class="text-brand-accent">.</span>
                            </h1>
                        </div>
                    </a>
                </div>

                <nav class="hidden md:flex items-center">
                    {load_menu name="primary" id="primaryNav" ulClass="flex space-x-8 text-sm font-medium text-slate-600"}
                </nav>

                <div class="hidden md:flex items-center space-x-3">
                    <a href="{url page="search"}" class="text-slate-400 hover:text-brand-900 transition p-2">
                        <i class="ph ph-magnifying-glass text-xl"></i>
                    </a>
                    <a href="{url page="submission" op="wizard"}" class="bg-brand-900 hover:bg-brand-800 text-white px-5 py-2.5 rounded-full text-sm font-medium transition shadow-lg shadow-blue-900/20">
                        {translate key="about.onlineSubmissions.submitArticle"}
                    </a>
                </div>

                <div class="md:hidden flex items-center">
                    <button onclick="toggleMobileMenu()" class="text-slate-900 p-2 focus:outline-none">
                        <i class="ph ph-list text-2xl"></i>
                    </button>
                </div>
            </div>
        </div>

        {* Мобильное меню *}
        <div id="mobile-menu" class="hidden md:hidden bg-white border-t border-slate-100 absolute w-full left-0 shadow-lg overflow-hidden transition-all">
            <div class="px-4 pt-2 pb-6 space-y-1">
                {load_menu name="primary" id="mobileNav" ulClass="flex flex-col" liClass="block px-3 py-3 text-base font-medium text-slate-700 hover:bg-slate-50 rounded-md"}
                <a href="{url page="submission" op="wizard"}" class="block px-3 py-3 text-base font-medium text-slate-900 font-bold hover:bg-slate-50 rounded-md text-brand-accent">
                    {translate key="about.onlineSubmissions.newSubmission"}
                </a>
            </div>
        </div>
    </header>

    <script>
        function toggleMobileMenu() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
        }
    </script>

    <main class="flex-grow">
