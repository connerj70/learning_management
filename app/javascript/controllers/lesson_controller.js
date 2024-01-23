import Sortable from 'stimulus-sortable'

// Connects to data-controller="lesson"
export default class extends Sortable {
  static values = { course: Number }

  onUpdate(event) {
    super.onUpdate(event)
    const newIndex = event.newIndex
    const id = event.item.id
    const courseId = this.courseValue
    console.log("csrf token: ", document.querySelector('[name="csrf-token"]').content)
    fetch(`/admin/courses/${courseId}/lessons/${id}/move`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ position: newIndex, id: id })
    })
  }
}
