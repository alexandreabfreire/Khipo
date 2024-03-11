unit uIControllerUser;

interface

type
  IControllerUser = interface
    ['{242708EB-F40F-47C3-BB72-CE8F85E5F574}']

    function Save (): Boolean;
    function Authentication(userName, userPassword : String): Boolean;

    end;
implementation

end.
