import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FrontEquipementComponent } from './front-equipement.component';

describe('FrontEquipementComponent', () => {
  let component: FrontEquipementComponent;
  let fixture: ComponentFixture<FrontEquipementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FrontEquipementComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FrontEquipementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
