# Action Cable provides the framework to deal with WebSockets in Rails.
# You can generate new channels where WebSocket features live using the `rails generate channel` command.
#
#= require_self
(->
  @App or (@App = {})
  App.toastr_hacks = {
    'closeButton': true,
    'debug': false,
    'newestOnTop': false,
    'progressBar': true,
    'positionClass': 'toast-top-right',
    'preventDuplicates': false,
    'onclick': null,
    'showDuration': '300',
    'hideDuration': '1000',
    'timeOut': '5000',
    'extendedTimeOut': '1000',
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut'
  };
  return
).call this
