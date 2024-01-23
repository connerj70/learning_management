import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = { completed: Object, signups: Object }

  initialize() {
    console.log("checking controller")
    const data = Object.values(this.completedValue)
    const labels = Object.keys(this.completedValue)
    const ctx = document.getElementById('chart')
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: "Lessons Completed",
          data: data,
          borderWidth: 3,
          fill: true,
          backgroundColor: "#fad1d5"
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        borderColor: "#e23e57",
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            grid: {
              color: "#e23e57"
            },
            border: {
              dash: [5, 5]
            },
            beginAtZero: true
          }
        }
      }
    })
    const data2 = Object.values(this.signupsValue)
    const labels2 = Object.keys(this.signupsValue)
    const ctx2 = document.getElementById('sign_ups_chart')
    new Chart(ctx2, {
      type: 'line',
      data: {
        labels: labels2,
        datasets: [{
          label: "Lessons Completed",
          data: data2,
          borderWidth: 3,
          fill: true,
          backgroundColor: "#fad1d5"
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        borderColor: "#e23e57",
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            grid: {
              color: "#e23e57"
            },
            border: {
              dash: [5, 5]
            },
            beginAtZero: true
          }
        }
      }
    })
  }
}
