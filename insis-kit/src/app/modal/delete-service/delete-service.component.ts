import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-delete-service',
  templateUrl: './delete-service.component.html',
  styleUrls: ['./delete-service.component.css']
})
export class DeleteServiceComponent implements OnInit {

  @Input() service : any
 
  constructor(public modal : NgbActiveModal) { }

  ngOnInit(): void {
  }

  close() {
    this.modal.close()
  }
}
