import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ToastrService } from 'ngx-toastr';
import { DeleteServiceComponent } from '../modal/delete-service/delete-service.component';
import { DeleteComponent } from '../modal/delete/delete.component';
import { EditServiceComponent } from '../modal/edit-service/edit-service.component';
import { PlateformesService } from '../services/plateformes.service';

@Component({
  selector: 'app-edit-plateforme',
  templateUrl: './edit-plateforme.component.html',
  styleUrls: ['./edit-plateforme.component.css']
})
export class EditPlateformeComponent implements OnInit {

  plateforme : any

  constructor(private toastr : ToastrService, private modaleService : NgbModal, private route : ActivatedRoute, private router : Router, private pfService : PlateformesService) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    let id = Number(this.route.snapshot.paramMap.get('id'))
    this.plateforme = await this.pfService.getById(id)
    console.log(this.plateforme);
    
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
