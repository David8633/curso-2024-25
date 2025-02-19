package com.model;

public class Triangulo {

	
	private double lado1;
	private double lado2;
	private double lado3;
	private double[] cantLados = {this.lado1,this.lado2,this.lado3};

	public Triangulo() {
		super();
		this.lado3 = 1;
	}
	
	public Triangulo( double lado1, double lado2, double lado3) {
		super();
		this.lado1 = lado1;
		this.lado2 = lado2;
		this.lado3 = lado3;
		}


	public double getLado1() {
		return lado1;
	}


	public void setLado1(double lado1) {
		this.lado1 = lado1;
	}


	public double getLado2() {
		return lado2;
	}


	public void setLado2(double lado2) {
		this.lado2 = lado2;
	}


	public double getLado3() {
		return lado3;
	}


	public void setLado3(double lado3) {
		this.lado3 = lado3;
	}
	
	public boolean esEquilatero(double[] cantLados) {
		boolean esEquilatero = false;
		if( this.lado1==this.lado2&& lado2==this.lado3) {
			esEquilatero=true;
		}
		return esEquilatero;
	}
	
	public boolean esIsolseles(double[] cantLados) {
		boolean isosles = false;
		if( this.lado1==this.lado2&& lado2!=this.lado3) {
			isosles=true;
		}
		return isosles;
	}
	
	public boolean escaleno(double[] cantLados) {
		return !esIsolseles(cantLados)&&!esEquilatero(cantLados);
	}
	
	public double pitagoras(double[] cantLados) {
		double resultado;
		return( resultado = Math.sqrt(Math.pow(lado1, 2)+Math.pow(lado2/2, 2)));
	}
	
	public double hallarAltura(double[] cantLados) {
		double resultado = 0;
		if( esEquilatero(cantLados)) {
			resultado = pitagoras(cantLados);
		}else if(esIsolseles(cantLados)) {
			if( lado1==lado3) {
			resultado = Math.sqrt(Math.pow(lado1, 2)+Math.pow(lado2/2, 2));
			}else if( lado2==lado3) {
			resultado = Math.sqrt(Math.pow(lado2, 2)+Math.pow(lado1/2, 2));

			}else if( lado1==lado2) {
				resultado = Math.sqrt(Math.pow(lado1, 2)+Math.pow(lado3/2, 2));

				}
		}
		return resultado;}

	
	public double calcularAreaEscaleno(double[] cantLados) {
		double s = (lado1+lado2+lado3)/2;
	    double area = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
	    return area;
	}
	
	public double calcularArea(double[] cantLados) {
		double resultado = 0; 
		if(esEquilatero(cantLados)) {
			resultado = (lado1 * hallarAltura(cantLados))/2;
		}else if(esIsolseles(cantLados)){
			if( lado1==lado2) {
				resultado = lado3 * hallarAltura(cantLados);
			}else if(lado2==lado3) {
				resultado = lado1 * hallarAltura(cantLados);
			}else if( lado3==lado1) {
				resultado = lado2 * hallarAltura(cantLados);

			}
		}
		
	return resultado;}
	
}
