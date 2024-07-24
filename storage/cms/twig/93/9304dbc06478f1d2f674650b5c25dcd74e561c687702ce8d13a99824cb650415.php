<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* C:\laragon\www\visual/themes/punto-visual/layouts/default.htm */
class __TwigTemplate_5678c835a2ab4f6272d6fedc458758f548e30f5ca2cb939c7d408270578c48f5 extends \Twig\Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $this->checkSecurity();
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 1
        echo "<!DOCTYPE html>
<html lang=\"es-MX\">
    <head>
      <meta charset=\"utf-8\">
      <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
      <title>Punto Visual | ";
        // line 6
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 6), "title", [], "any", false, false, true, 6), 6, $this->source), "html", null, true);
        echo "</title>
      <meta name=\"keywords\" content=\"\">
      <meta name=\"description\" content=\"\">
      <meta name=\"author\" content=\"PuntoVisual\">
      <meta name=\"robots\" content=\"index, follow\">
\t    <link rel=\"alternate\" hreflang=\"es-mx\" href=\"\">
      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">

      <link rel=\"apple-touch-icon\" href=\"";
        // line 14
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("favicon.png");
        echo "\">
\t\t  <link rel=\"icon\" type=\"image/png\" href=\"";
        // line 15
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("favicon.png");
        echo "\">
\t\t  <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"";
        // line 16
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("favicon.png");
        echo "\">

      <!-- S T Y L E S - G E N E R A L -->
      <link rel=\"stylesheet\" type=\"text/css\" href=\"";
        // line 19
        echo $this->extensions['Cms\Twig\Extension']->themeFilter([0 => "assets/vendor/bootstrap/css/bootstrap.min.css", 1 => "assets/css/nprogress.css", 2 => "assets/css/vendor/aos.css", 3 => "assets/css/style.min.css"]);
        // line 24
        echo "\">
      ";
        // line 25
        echo $this->env->getExtension('Cms\Twig\Extension')->assetsFunction('css');
        echo $this->env->getExtension('Cms\Twig\Extension')->displayBlock('styles');
        // line 26
        echo "      <script type=\"text/javascript\" src=\"";
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/vendor/jquery/dist/jquery.min.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 27
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/vendor/modernizr-2.8.3.min.js");
        echo "\"></script>
      <script>let siteURL = \"";
        // line 28
        echo $this->extensions['Cms\Twig\Extension']->pageFilter("");
        echo "\";</script>

    </head>
    <body class=\"";
        // line 31
        echo twig_escape_filter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, twig_get_attribute($this->env, $this->source, ($context["this"] ?? null), "page", [], "any", false, false, true, 31), "id", [], "any", false, false, true, 31), 31, $this->source), "html", null, true);
        echo "\" style=\"display: none;\">
      <div class=\"overProgress fadeX\"></div>

      ";
        // line 34
        $context['__cms_partial_params'] = [];
        echo $this->env->getExtension('Cms\Twig\Extension')->partialFunction("site/header"        , $context['__cms_partial_params']        , true        );
        unset($context['__cms_partial_params']);
        // line 35
        echo "
      <main>
        <div id=\"primary\" class=\"content-area\">
          ";
        // line 38
        echo $this->env->getExtension('Cms\Twig\Extension')->pageFunction();
        // line 39
        echo "        </div>
      </main><!-- end.Main -->

      ";
        // line 42
        $context['__cms_partial_params'] = [];
        echo $this->env->getExtension('Cms\Twig\Extension')->partialFunction("site/footer"        , $context['__cms_partial_params']        , true        );
        unset($context['__cms_partial_params']);
        // line 43
        echo "        
      <script type=\"text/javascript\" src=\"";
        // line 44
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/plugins/nprogress.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 45
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/vendor/bootstrap/js/bootstrap.bundle.min.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 46
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/vendor/jquery.easing.1.3.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js\"></script>
      <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 49
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/vendor/greensock/dist/TweenMax.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 50
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/plugins/jquery.validate.min.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 51
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/plugins/additional-methods.min.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 52
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/plugins/aos.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 53
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/plugins/slick.min.js");
        echo "\"></script>
      <script type=\"text/javascript\" src=\"";
        // line 54
        echo $this->extensions['Cms\Twig\Extension']->themeFilter("assets/js/scripts/layoutScripts.js?ver=1.0.1");
        echo "\"></script>
      ";
        // line 55
        $_minify = System\Classes\CombineAssets::instance()->useMinify;
        if ($_minify) {
            echo '<script src="' . Request::getBasePath() . '/modules/system/assets/js/framework.combined-min.js"></script>'.PHP_EOL;
        }
        else {
            echo '<script src="' . Request::getBasePath() . '/modules/system/assets/js/framework.js"></script>'.PHP_EOL;
            echo '<script src="' . Request::getBasePath() . '/modules/system/assets/js/framework.extras.js"></script>'.PHP_EOL;
        }
        echo '<link rel="stylesheet" property="stylesheet" href="' . Request::getBasePath() .'/modules/system/assets/css/framework.extras'.($_minify ? '-min' : '').'.css">'.PHP_EOL;
        unset($_minify);
        // line 56
        echo "      ";
        echo $this->env->getExtension('Cms\Twig\Extension')->assetsFunction('js');
        echo $this->env->getExtension('Cms\Twig\Extension')->displayBlock('scripts');
        // line 57
        echo "
      <script>
        \$('body').show();
        NProgress.start();
        setTimeout(function() {
          NProgress.done(); \$('.fadeX').addClass('out');
        }, 1000);
      </script>
    </body>
</html>";
    }

    public function getTemplateName()
    {
        return "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  176 => 57,  172 => 56,  161 => 55,  157 => 54,  153 => 53,  149 => 52,  145 => 51,  141 => 50,  137 => 49,  131 => 46,  127 => 45,  123 => 44,  120 => 43,  116 => 42,  111 => 39,  109 => 38,  104 => 35,  100 => 34,  94 => 31,  88 => 28,  84 => 27,  79 => 26,  76 => 25,  73 => 24,  71 => 19,  65 => 16,  61 => 15,  57 => 14,  46 => 6,  39 => 1,);
    }

    public function getSourceContext()
    {
        return new Source("<!DOCTYPE html>
<html lang=\"es-MX\">
    <head>
      <meta charset=\"utf-8\">
      <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
      <title>Punto Visual | {{ this.page.title }}</title>
      <meta name=\"keywords\" content=\"\">
      <meta name=\"description\" content=\"\">
      <meta name=\"author\" content=\"PuntoVisual\">
      <meta name=\"robots\" content=\"index, follow\">
\t    <link rel=\"alternate\" hreflang=\"es-mx\" href=\"\">
      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\">

      <link rel=\"apple-touch-icon\" href=\"{{ 'favicon.png'|theme }}\">
\t\t  <link rel=\"icon\" type=\"image/png\" href=\"{{ 'favicon.png'|theme }}\">
\t\t  <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"{{ 'favicon.png'|theme }}\">

      <!-- S T Y L E S - G E N E R A L -->
      <link rel=\"stylesheet\" type=\"text/css\" href=\"{{ [
        'assets/vendor/bootstrap/css/bootstrap.min.css',
        'assets/css/nprogress.css',
        'assets/css/vendor/aos.css',
        'assets/css/style.min.css',
      ]|theme }}\">
      {% styles %}
      <script type=\"text/javascript\" src=\"{{ 'assets/vendor/jquery/dist/jquery.min.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/vendor/modernizr-2.8.3.min.js'|theme }}\"></script>
      <script>let siteURL = \"{{''|page}}\";</script>

    </head>
    <body class=\"{{ this.page.id }}\" style=\"display: none;\">
      <div class=\"overProgress fadeX\"></div>

      {% partial 'site/header' %}

      <main>
        <div id=\"primary\" class=\"content-area\">
          {% page %}
        </div>
      </main><!-- end.Main -->

      {% partial 'site/footer' %}
        
      <script type=\"text/javascript\" src=\"{{ 'assets/js/plugins/nprogress.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/vendor/bootstrap/js/bootstrap.bundle.min.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/vendor/jquery.easing.1.3.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js\"></script>
      <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/vendor/greensock/dist/TweenMax.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/plugins/jquery.validate.min.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/plugins/additional-methods.min.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/plugins/aos.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/plugins/slick.min.js'|theme }}\"></script>
      <script type=\"text/javascript\" src=\"{{ 'assets/js/scripts/layoutScripts.js?ver=1.0.1'|theme }}\"></script>
      {% framework extras %}
      {% scripts %}

      <script>
        \$('body').show();
        NProgress.start();
        setTimeout(function() {
          NProgress.done(); \$('.fadeX').addClass('out');
        }, 1000);
      </script>
    </body>
</html>", "C:\\laragon\\www\\visual/themes/punto-visual/layouts/default.htm", "");
    }
    
    public function checkSecurity()
    {
        static $tags = array("styles" => 25, "partial" => 34, "page" => 38, "framework" => 55, "scripts" => 56);
        static $filters = array("escape" => 6, "theme" => 14, "page" => 28);
        static $functions = array();

        try {
            $this->sandbox->checkSecurity(
                ['styles', 'partial', 'page', 'framework', 'scripts'],
                ['escape', 'theme', 'page'],
                []
            );
        } catch (SecurityError $e) {
            $e->setSourceContext($this->source);

            if ($e instanceof SecurityNotAllowedTagError && isset($tags[$e->getTagName()])) {
                $e->setTemplateLine($tags[$e->getTagName()]);
            } elseif ($e instanceof SecurityNotAllowedFilterError && isset($filters[$e->getFilterName()])) {
                $e->setTemplateLine($filters[$e->getFilterName()]);
            } elseif ($e instanceof SecurityNotAllowedFunctionError && isset($functions[$e->getFunctionName()])) {
                $e->setTemplateLine($functions[$e->getFunctionName()]);
            }

            throw $e;
        }

    }
}
