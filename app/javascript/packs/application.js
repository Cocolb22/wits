// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

const Uppy = require('@uppy/core')
const Dashboard = require('@uppy/dashboard')
const ActiveStorageUpload = require('@excid3/uppy-activestorage-upload')
const Webcam = require('@uppy/webcam')

require('@uppy/core/dist/style.css')
require('@uppy/dashboard/dist/style.css')

document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('[data-uppy]').forEach(element => setupUppy(element))
})

function setupUppy(element) {
  let trigger = element.querySelector('[data-behavior="uppy-trigger"]')
  let form = element.closest('form')
  let direct_upload_url = document.querySelector('meta[name="direct-upload-url"]').getAttribute('content')
  let field_name = element.dataset.uppy

  trigger.addEventListener("click",(event) => event.preventDefault())

  let uppy = new Uppy({
    autoProceed: false,
    allowMultipleUploadBatches: true,
    logger: Uppy.debugLogger
  })
  uppy.use(ActiveStorageUpload, {
    directUploadUrl: direct_upload_url
  })

  uppy.use(Dashboard, {
    trigger: trigger,
    closeAfterFinish: true,
  })

  uppy.use(Webcam, {
    target: Dashboard,
    onBeforeSnapshot: () => Promise.resolve(),
    countdown: false,
    modes: [
      'picture',
    ],
    mirror: true,
    preferredImageMimeType: null,
    locale: {},
  })

  uppy.on('complete', (result) => {
    element.querySelectorAll('[data-pending-upload]').forEach(element => element.parentNode.removeChild(element))

    result.successful.forEach(file => {
      appendUploadedFile(element, file, field_name)
      setPreview(element, file)
    })

    uppy.reset()
  })
}

function appendUploadedFile(element, file, field_name) {
  const hiddenField = document.createElement('input')

  hiddenField.setAttribute('type', 'hidden')
  hiddenField.setAttribute('multiple', 'multiple')
  hiddenField.setAttribute('name', field_name)
  hiddenField.setAttribute('data-pending-upload', true)
  hiddenField.setAttribute('value', file.response.signed_id)

  element.appendChild(hiddenField)
}

function setPreview(element, file) {
  const imgPreview = document.getElementById("imgPreview")
  const imgPrev = document.createElement('img')

  imgPrev.setAttribute('src', file.preview)
  imgPreview.appendChild(imgPrev)
}


// masonry carousel pour les photos de commentaires dans la shows description

const grid_masonry = document.querySelector('.grid-masonry');

const msnry = new Masonry( grid_masonry, {
  itemSelector: '.grid-item-masonry',
  columnWidth: '.grid-sizer-masonry',
  percentPosition: true
});

imagesLoaded( grid_masonry ).on( 'progress', function() {
  // layout Masonry after each image loads
  msnry.layout();
});
