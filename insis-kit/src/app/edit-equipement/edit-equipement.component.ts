import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { EquipementService } from '../services/equipement.service';

@Component({
  selector: 'app-edit-equipement',
  templateUrl: './edit-equipement.component.html',
  styleUrls: ['./edit-equipement.component.css']
})
export class EditEquipementComponent implements OnInit {

  equipement : any

  constructor(private toastr : ToastrService, private route : ActivatedRoute, private eqtService : EquipementService, private router : Router) { }

  ngOnInit(): void {
  }

  async loadData() {

  }

  saved() {
    this.toastr.success('Succes', 'Sauvegarde avec succes')
  }

  return() {
    this.router.navigate(['reseaux'])
  }
}
