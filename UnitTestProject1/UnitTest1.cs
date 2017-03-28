using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Assert.AreEqual(ClassLibrary1.Class1.ReturnFive(), 5);
            Assert.AreEqual(ClassLibrary1.Class1.ReturnSix(), 6);
        }

        [TestMethod]
        public void ShouldFail()
        {
            Assert.AreEqual(ClassLibrary1.Class1.ReturnFive(),
                            ClassLibrary1.Class1.ReturnSix());
        }
    }
}
