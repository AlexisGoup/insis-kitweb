import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditReseauComponent } from './edit-reseau.component';

describe('EditReseauComponent', () => {
  let component: EditReseauComponent;
  let fixture: ComponentFixture<EditReseauComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditReseauComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EditReseauComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
