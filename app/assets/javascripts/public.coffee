# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $(".top-news").click (e)->
        el = e.currentTarget
        $(el).toggleClass("open")
        #console.log e
        return
    return
        #if(this.is(".disabled, :disabled"))return $parent=getParent($this),isActive=$parent.hasClass("open"),clearMenus(),isActive||$parent.toggleClass("open"),$this.focus(),!1
