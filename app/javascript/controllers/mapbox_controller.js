import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const customMarker = document.createElement("div")
        customMarker.className = "marker"
        // customMarker.id = `marker-${marker.spot_id}`
        customMarker.style.backgroundImage = `url('${marker.image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.width = "50px"
        customMarker.style.height = "50px"

        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(this.map)
      });
    }

    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

  // hovering(event) {
  //   console.log(event.currentTarget)
  //   const spotId = event.currentTarget.dataset.id
  //   const markerId = `marker-${spotId}`

  //   const marker = document.getElementById(markerId)
  //   marker.style.width = "75px"
  //   marker.style.height = "75px"
  // }

  // leaving(event) {
  //   console.log(event.currentTarget)
  //   const spotId = event.currentTarget.dataset.id
  //   const markerId = `marker-${spotId}`

  //   const marker = document.getElementById(markerId)
  //   marker.style.width = "50px"
  //   marker.style.height = "50px"
  // }
}