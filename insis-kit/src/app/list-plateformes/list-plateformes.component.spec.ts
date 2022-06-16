import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListPlateformesComponent } from './list-plateformes.component';

describe('ListPlateformesComponent', () => {
  let component: ListPlateformesComponent;
  let fixture: ComponentFixture<ListPlateformesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListPlateformesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListPlateformesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
