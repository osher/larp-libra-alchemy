import axios from "axios";
import model from "./model";

class Service {
  init() {
    return axios.get(`http://localhost:3001/init`).then(response => {
      model.init(response);
    });
  }

  preview(data) {
    const { id, uuid } = data;
    return axios.get(
      `${process.env.REACT_APP_REST_API}/v2/preview?id=${id}&uuid=${uuid}`
    );
  }
}

export default new Service();
