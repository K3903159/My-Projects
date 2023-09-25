using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Clock
{

    public class Counter
    {
        private int _count;
        private string _name;


        public Counter(string name)
        {
            _name = name;
            _count = 0;
        }

        public Counter(string name, int count)
        {
            _name = name;
            _count = count;
        }
        public int Ticks
        {
            get
            {
                return _count;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }


        public void Increment()
        {
            _count++;
        }

        public void Reset()
        {
            _count = 0;
        }
    }
}
