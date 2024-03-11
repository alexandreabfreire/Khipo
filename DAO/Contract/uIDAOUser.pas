unit uIDAOUser;

interface

type
  IDAOUser = interface
    ['{14F86D8A-F6F9-445D-9EB1-9663F7FA743B}']

    function Save: Boolean;
    function Authentication(userName, userPassword : String): Boolean;

    end;

implementation

end.
