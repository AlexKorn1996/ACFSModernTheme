<?php
import('lib.pkp.classes.plugins.ThemePlugin');

class ACFSModernThemePlugin extends ThemePlugin {
    /**
     * Ініціалізація теми: підключення стилів та скриптів
     */
    public function init() {
        // 1. Підключаємо Google Fonts (Merriweather та Inter)
        $this->addStyle('googleFonts', 'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300&display=swap', array('contexts' => 'frontend'));

        // 2. Підключаємо Tailwind CSS через CDN (як у вашому концепті)
        $this->addScript('tailwind', 'https://cdn.tailwindcss.com', array('contexts' => 'frontend'));

        // 3. Підключаємо іконки Phosphor
        $this->addScript('phosphorIcons', 'https://unpkg.com/@phosphor-icons/web', array('contexts' => 'frontend'));

        // 4. (Опціонально) Додаємо конфігурацію Tailwind для ваших кольорів
        // Ви можете додати inline-скрипт прямо тут
        $this->addScript('tailwindConfig', "
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
        ", array('contexts' => 'frontend', 'inline' => true));
    }

    /**
     * Назва теми в адмін-панелі
     */
    public function getDisplayName() {
        return 'ACFS Modern Theme';
    }

    /**
     * Опис теми
     */
    public function getDescription() {
        return 'Сучасна академічна тема на базі Tailwind CSS для журналу ACFS.';
    }
}
