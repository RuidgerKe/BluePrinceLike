using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.VFX;

public class TaskCutscene : MonoBehaviour
{
    [SerializeField] private PlayableDirector director;
    [SerializeField] private GameObject Dust;
    [SerializeField] private GameObject Dust2;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }
    void EventTriggers()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Y))
        {
            director.Play();
            Dust.SetActive(true);
            Dust2.SetActive(true);

        }
        if (Input.GetKeyDown(KeyCode.X))
        {
            Dust.SetActive(false);
            Dust2.SetActive(false);     
        }
    }
}
