import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static targets = ["map", "latitude", "longitude", "address", "coordinates", "link"]

  static values = {
    apiKey: String,
    pinpoint: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/lapin0521/cl449u0fb008615o5pr1asjca",
      center: ["-3.563637586114924","48.801364049065796"],
      pitch: 30, // pitch in degrees
      bearing: 5, // bearing in degrees
      zoom: 8
    })

    
    this.map.on('click', (e) => {
      const lngLat = e.lngLat
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url(${this.pinpointValue})`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.zIndex = "1000000"
      customMarker.style.width = "50px"
      customMarker.style.height = "50px"

      // new mapboxgl.Marker(customMarker)
      // .setLngLat([ lngLat.lng, lngLat.lat ])
      // .addTo(this.map)


      this.latitudeTarget.value = lngLat.lat
      this.longitudeTarget.value = lngLat.lng

      this.mapTarget.style.visibility = "hidden"
      this.addressTarget.classList.add("d-none")
      this.coordinatesTarget.classList.remove("d-none")
      this.linkTarget.innerText = "Modifier l'emplacement"
    });
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    this.mapTarget.style.visibility = "visible"
  }
}
