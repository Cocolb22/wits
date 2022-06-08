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
      style: "mapbox://styles/lapin0521/cl449u0fb008615o5pr1asjca",
      pitch: 30, // pitch in degrees
      bearing: 5, // bearing in degrees
      zoom: 10
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const customMarker = document.createElement("a")
        customMarker.className = "marker"
        customMarker.style.backgroundImage = `url('${marker.image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.zIndex = "1000000"
        customMarker.style.width = "50px"
        customMarker.style.height = "50px"
        customMarker.setAttribute("data-controller", "scroll-to")
        customMarker.setAttribute("data-scroll-to-offset-value", "430")
        customMarker.setAttribute("href", `#spot-${marker.id}`)

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
}
