namespace Clock
{
    public class Clock
    {
        Counter _second = new Counter("second");
        Counter _minute = new Counter("minute");
        Counter _hour = new Counter("hour");

        public void Tick()
        {
            _second.Increment();
            if(_second.Ticks > 59)
            {
                _minute.Increment();
                _second.Reset();
                if (_minute.Ticks > 59)
                {
                    _hour.Increment();
                    _minute.Reset();

                    if (_hour.Ticks > 23)
                    {
                        Reset();
                    }
                }
            }
        }

        public void setTime(string time)
        {
            string[] array = time.Split(":");
            _hour = new Counter("hour", int.Parse(array[0]));
            _minute = new Counter("minute", int.Parse(array[1]));
            _second = new Counter("second", int.Parse(array[2]));
        }
        public void Reset()
        {
            _second.Reset();
            _minute.Reset();
            _hour.Reset();
        }

        public string printTime() 
        {
            return $"{_hour.Ticks:D2}:{_minute.Ticks:D2}:{_second.Ticks:D2}";
        }
    }
}
