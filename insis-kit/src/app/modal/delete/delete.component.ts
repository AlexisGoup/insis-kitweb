import { Component, Input, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-delete',
  templateUrl: './delete.component.html',
  styleUrls: ['./delete.component.css']
})
export class DeleteComponent implements OnInit {

  @Input() element : any
 
  constructor(public modal : NgbActiveModal) { }

  ngOnInit(): void {
  }

  close() {
    this.modal.close()
  }
}
