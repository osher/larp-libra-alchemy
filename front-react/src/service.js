import axios from "axios";
import model from "libra-front-model";

export default {
  init() {
    return axios.get('http://localhost:3030/model').then(response => {
      model.init(response.data);
    });
  },

  createPotion(potion) {
    throw new Error('not implemented');
  }
}
