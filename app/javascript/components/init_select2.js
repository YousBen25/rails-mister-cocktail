import 'select2';
import $ from 'jquery';

const initSelect2 = () => {
  $('.select2').select2();
};

const multipleSelect = () => {
  $(document).ready(function() {
    $('.multiple-select').select2();
  });
}

export { initSelect2, multipleSelect  };
