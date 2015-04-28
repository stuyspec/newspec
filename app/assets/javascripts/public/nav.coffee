(($) ->
    setNav = (cutoff, parent, className) ->
        top = $(window).scrollTop()
        has_class = parent.hasClass(className)
        if top > cutoff
            parent.addClass(className) unless has_class
        else
            parent.removeClass(className) if has_class

    $(window).load ->
        cutoff = $("#header").height()
        nav_parent = $('nav#primary').parent()
        callSetNav = -> setNav(cutoff, nav_parent, 'navbar-fixed')
        console.log cutoff
        $(window).scroll callSetNav
        $(".hamburger").sideNav()

)(jQuery)
