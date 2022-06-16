import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-edit-service',
  templateUrl: './edit-service.component.html',
  styleUrls: ['./edit-service.component.css']
})
export class EditServiceComponent implements OnInit {

  @Input() service : any
 
  constructor(public modal : NgbActiveModal) { }

  ngOnInit(): void {
  }

  close() {
    this.modal.close()
  }
}
