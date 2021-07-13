import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PlateformesService } from '../services/plateformes.service';
import { ReseauService } from '../services/reseau.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { EditServiceComponent } from '../modal/edit-service/edit-service.component';
import { DeleteServiceComponent } from '../modal/delete-service/delete-service.component';
import { DeleteComponent } from '../modal/delete/delete.component';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-edit-reseau',
  templateUrl: './edit-reseau.component.html',
  styleUrls: ['./edit-reseau.component.css']
})
export class EditReseauComponent implements OnInit {

  reseau : any
  plateformes : any

  constructor( private route : ActivatedRoute, private reseauService : ReseauService, private pfServices : PlateformesService, private modaleService : NgbModal, private toastr : ToastrService, private router : Router) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    let id = Number(this.route.snapshot.paramMap.get('id'))
    this.reseau = await this.reseauService.getById(id)
    this.plateformes = await this.pfServices.getByReseau(this.reseau)
  }

  editService(service : any) {
    let modale = this.modaleService.open(EditServiceComponent)
    modale.componentInstance.service = service
  }

  deleteService(service : any) {
    let modale = this.modaleService.open(DeleteServiceComponent)
    modale.componentInstance.service = service
  }

  deleteModal(element : any) {
    let modale = this.modaleService.open(DeleteComponent)
    modale.componentInstance.element = element
  }

  saved() {
    this.toastr.success('Succes', 'Sauvegarde avec succes')
  }

  return() {
    this.router.navigate(['reseaux'])
  }
}
