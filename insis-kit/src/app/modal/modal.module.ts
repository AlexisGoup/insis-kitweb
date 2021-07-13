import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EditServiceComponent } from './edit-service/edit-service.component';
import { DeleteServiceComponent } from './delete-service/delete-service.component';
import { DeleteComponent } from './delete/delete.component';



@NgModule({
  declarations: [
    EditServiceComponent,
    DeleteServiceComponent,
    DeleteComponent
  ],
  imports: [
    CommonModule
  ],
  exports : [
    EditServiceComponent,
    DeleteServiceComponent
  ]
})
export class ModalModule { }
