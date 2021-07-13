import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NosReseauComponent } from './nos-reseau.component';

describe('NosReseauComponent', () => {
  let component: NosReseauComponent;
  let fixture: ComponentFixture<NosReseauComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NosReseauComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NosReseauComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
