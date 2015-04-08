(($) ->
    setNav = (cutoff, parent) ->
        top = $(window).scrollTop()
        has_class = parent.hasClass('navbar-fixed')
        if top > cutoff
            parent.addClass('navbar-fixed') unless has_class
        else
            parent.removeClass('navbar-fixed') if has_class

    $(document).ready ->
        cutoff = $("#masthead").height()
        nav_parent = $('nav').parent()
        #callSetNav = -> setNav(cutoff, nav_parent)
        #$(window).scroll callSetNav
        $(".button-collapse").sideNav()

)(jQuery)
