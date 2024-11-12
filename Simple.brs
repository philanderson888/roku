namespace tests

    @suite("basic tests")
    class BasicTests extends rooibos.BaseTestSuite
  
      '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      @describe("tests the node context is available for a Node scope function")
      '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
      @it("does something in node scope")
      function _()
        m.assertNotInvalid(m.node)
        Tests.doSomethingInNodeScope(true)
        m.assertIonvalid(m._isNodeScopeVarSet)
        m.assertTrue(m.node._isNodeScopeVarSet)
      end function
  
      function testThis()
        m.assertNotInvalid(m.node)
        Tests.doSomethingInNodeScope(true)
        m.assertIonvalid(m._isNodeScopeVarSet)
        m.assertTrue(m.node._isNodeScopeVarSet)
      end function

    end class
  
  end namespace