BootStripe
==========

A [SilverStripe](http://www.silverstripe.org) theme built with [Gulp](http://gulpjs.com/) and [Bower](http://bower.io/), incorporating [Bootstrap](http://getbootstrap.com/) and [Font Awesome](http://fontawesome.io/).

What we're cooking with
-----------------------

The Sass version of Bootstrap is used due its ability to override the default variables without manually managing the Bootstrap source files.

There's a layout for `Page` and a custom `HomePage` type.

We've also smashed out some custom Sass so that SilverStripes default nav classes work with the Bootstrap nav classes.

There's also a custom Breadcrumbs template which also matches the Bootstrap structure.

And because your SEO expert gets all twitchy if your site doesn't have a contact form, we've totally tweaked the Sass so the [UserForms](http://addons.silverstripe.org/add-ons/silverstripe/userforms) doesn't look so au naturale.

If you're enabled full-text search you should see a nice search box in the header. This does expect a top level page called 'search', but it makes sense to have a consistent URL right?

Installation
------------

- Since you're not going to use theme as stock (right?), download the latest release from [bootstripe](https://github.com/XploreNet/bootstripe).
- Extract it to a theme directory of your choice. The default expected theme directory is `default`.
- From the new theme directory, run `npm install` from the command line.
- Run `gulp build` to generate the real theme files.
- Update your SilverStripe configuration to use your fancy pants new theme.

How to use
----------

All the public files are in the `src` sub-directory. These are parsed via Gulp to generate the real files SilverStripe will display.

While you're developing just run `gulp` from the theme directory and you'll get live reload in your browser (also checkout [localhost:3001](http://localhost:3000/) for the live-reload control panel).

Then once you're all done and ready to ship, `gulp build` will create the ultimate optimised version of your theme.

Tools
-----

### Custom Fonts

If you need to use a custom, say from [Google Fonts](https://www.google.com/fonts), there are two places you need to include it.

First is as a `<link>` in the head of `templates/Page.ss`.

The second is if you want the font to appear in the CMS while editing pages, in which case include as a css `@import` at the top of `src/sass/editor.scss`.

You can then override the Bootstrap font variables to apply your font as required.

### Non Physical & Non Visible Children Pages

The base `Page` class should have a function `getShowInDropdownIfParent` or a dbfield `ShowInDropdownIfParent` that returns true.
For any pages that you don't want to show as the first child in the dropdown of the main nav if they have child pages set this to false and you're good to go!

The inverse is Sometimes a page should never show it's children in the nav (I'm lookin at you blog!) and setting the option on all child pages is a pain so instead
add a function `getHideChildrenFromNavigation` or a dbfield `HideChildrenFromNavigation` that returns false and it's children are outa there.

### Responsive Information

We have a wicked little tool that will output a bunch of information about the screen size, bootstrap container and what not and to activate it you just need to
add a function `getShowResponsiveOutput` or a db field `ShowResponsiveOutput` to the SiteConfig and make it return true. When you want it gone set it to false.

### Analytics

Analytics aren't just for google and we know that, So if you add a function `getCustomFooterOutput` or `getCustomHeaderOutput`
or a dbfield `CustomerFooterOutput` or `CustomerHeaderOutput` to your SiteConfig and we'll deal with activating it making it nice and easy to have different (or
 none at all) tracking code per environment.

License
-------

[MIT License](http://en.wikipedia.org/wiki/MIT_License)