jQuery ->
  $('#application_layout #users_index_table').dataTable
    iDisplayLength: $("#application_layout #users_index_table").data("displayLength")
    aLengthMenu: [[10, 25, 50, 100], ["10", "25", "50", "100"]]
    sPaginationType: "full_numbers"
    paging: true,
    autoWidth: false
    bJQueryUI: true
    bPaginate: true
    sAjaxSource: $('#application_layout #users_index_table').data('source')
    responsive: true
    aoColumns: [
      { mData: 'last_name' },
      { mData: 'first_name' },
      { mData: 'email' },
      { mData: 'sign_in_count' },
      { mData: 'created_at' },
      { mData: 'updated_at' },
      { mData: 'actions' },
    ]
    aoColumnDefs: [{
        bSortable: false,
        aTargets: ['nosort']
    }]
