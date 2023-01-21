import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Gender } from '../models/api-models/gender.model';

@Injectable({
  providedIn: 'root'
})
export class GenderService {

  private baseApiUrl: string  = "https://localhost:44300";

  constructor(private httpClient: HttpClient) { }

  getGenders(): Observable<Gender[]>{
    return this.httpClient.get<Gender[]>(`${this.baseApiUrl}/Gender`);
  }

  getGender(id: string): Observable<Gender>{
    return this.httpClient.get<Gender>(`${this.baseApiUrl}/Gender/${id}`);
  } 
}
