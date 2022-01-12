within OM_SP7;

package Socket 
package Functions
    function getJointPositions
      input OM_SP7.Socket.ConnectionObjects.SocketConnection con;
      input Real a;
      output Real ave;
      external "C" ave = getJointPositions(con,a) annotation(Include = "#include \"F:/Softwares/OpenModelica/OM_SP7/socketClient.c\"");
    end getJointPositions;
  end Functions;

  package ConnectionObjects
    class SocketConnection
    
      extends ExternalObject;
    
      function constructor
        output SocketConnection connection;
        external "C" connection = initSocketConnection()
          annotation(Include = "#include \"F:/Softwares/OpenModelica/OM_SP7/socketClient.c\"");
      end constructor;
    
      function destructor "close connection"
        input SocketConnection connection;
        external "C" closeSocketConnection(connection)
          annotation(Include = "#include \"F:/Softwares/OpenModelica/OM_SP7/socketClient.c\"");
      end destructor;
    
    end SocketConnection;
  end ConnectionObjects;
end Socket;
