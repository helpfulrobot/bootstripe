BootStripe
==========

A [SilverStripe](http://www.silverstripe.org) theme built with [Grunt](http://gruntjs.com/) and [Bower](http://bower.io/), incorporating [Bootstrap](http://getbootstrap.com/) and [Font Awesome](http://fontawesome.io/).

What we're cooking with
-----------------------

The Sass version of Bootstrap is used due its ability to override the default variables without manually managing the Bootstrap source files.

Grunt brings the ability to use live reload while developing your theme. Once built, the `build` task will concatenate and minify all your CSS and Javascript, and perform image optimisation. Of course any Grunt task can be added to improve your workflow as you see fit.

There's a layout for `Page` and a custom `HomePage` type.

We've also smashed out some custom Sass so that SilverStripes default nav classes work with the Bootstrap nav classes.

There's also a custom Breadcrumbs template which also matches the Bootstrap structure.

And because your SEO expert gets all twitchy if your site doesn't have a contact form, we've totally tweaked the Sass so the [UserForms](http://addons.silverstripe.org/add-ons/silverstripe/userforms) doesn't look so au naturale.

If you're enabled full-text search you should see a nice search box in the header. This does expect a top level page called 'search', but it makes sense to have a consistent URL right?

Installation
------------

- Since you're not going to use theme as stock (right?), download the latest release from https://github.com/XploreNet/bootstripe.
- Extract it to a theme directory of your choice. The default expected theme directory is `bootstripe`.
- From the new theme directory, run `npm install` and `bower install` from the command line.
- Run `grunt build` to generate the real theme files.
- Update your SilverStripe configuration to use your fancy pants new theme.

Configuration
-------------

If you rename the theme directory to something other than __bootstripe__, update `Gruntfile.js` and set `config.themeName` to the new directory name.

How to use
----------

All the files you should be working on are in the `src` sub-directory. These are parsed via Grunt to generate the real files SilverStripe will display.

While you're developing just run `grunt` from the theme directory and you'll get live reload in your browser. Assuming you've installed the plugin for [Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/livereload/).

Any time you want to link to an asset from your theme, just prepend `{themedir}` to the path and Grunt will ensure the right URL is generated, e.g.:

`<link rel="stylesheet" href="{themedir}css/main.css">`

becomes

`<link rel="stylesheet" href="/themes/bootstripe/css/main.css">`

Then once you're all done and ready to ship, `grunt build` will create the ultimate optimised version of your theme.

Tools
-----

### Custom Fonts

If you need to use a custom, say from [Google Fonts](https://www.google.com/fonts), there are two places you need to include it.

First is as a `<link>` in the head of `src/templates/Page.ss`.

The second is if you want the font to appear in the CMS while editing pages, in which case include as a css `@import` at the top of `src/sass/editor.scss`.

You can then override the Bootstrap font variables to apply your font as required.

### Favicons

Replace `src/favicon.png` with a favicon of your choice and it will be automatically converted to the appropriate formats.
`src/templates/Page.ss` already has the correct code to include all the generated versions.

It's recommended to use a 512 x 512 pixel as your source for your favicon, with a transparent background.
Some versions of the favicon will apply a background colour which is defined in `Gruntfile.js`.

### Responsive Images

A Sass mixin is provided to apply a background image appropriate for the various breakpoints to any css class.

1. Save your image into `src/images/rwd`, preferably at 4,096px wide or greater.
2. In your css class definition apply the mixin `@include rwd-image(image_name);` without the extension (generated images are all jpg).
3. Apply your own background sizing to your class, e.g. `background-size: cover;`.

During Grunt compilation a new version of the image will be generated for each breakpoint, and for high-DPI devices.
The mixin will apply the generated images with the `background-image` property as appropriate.

The generated images are designed to be displayed full-width at the given breakpoint, so this system is ideal for banners or carousels.

License
-------

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
