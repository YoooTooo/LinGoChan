// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap';
import '../stylesheets/application.scss';
import '../stylesheets/staticpages.scss';
import '../stylesheets/userpages.scss';
import '../stylesheets/posts.scss';
import '../stylesheets/about_page.scss';
import './bootstrap_custom.js'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap");
require('load_animation.js')
require('letter_counter_for_reply_form.js')
require("letter_counter_for_feedback_form.js")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
 const images = require.context('../images', true)
 const imagePath = (name) => images(name, true)
