package es.golemdr.prefieromizona.domain;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id", scope = QRData.class)
public class QRData {

	private Long id;
	private String codComercio;
	private String codCliente;
	private int cantPuntos;
	private long time;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCodComercio() {
		return codComercio;
	}

	public void setCodComercio(String codComercio) {
		this.codComercio = codComercio;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public int getCantPuntos() {
		return cantPuntos;
	}

	public void setCantPuntos(int cantPuntos) {
		this.cantPuntos = cantPuntos;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "QRData [id=" + id + ", codComercio=" + codComercio + ", codCliente=" + codCliente + ", cantPuntos="
				+ cantPuntos + ", time=" + time + "]";
	}

}
